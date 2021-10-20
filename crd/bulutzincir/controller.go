/*
Copyright 2016 The Rook Authors. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// Package main for a ethereum operator
package main

import (
	"fmt"

	bz "bulutzincir"
	ethereum "bulutzincir/pkg/apis/bulutzincir/ethereum/v1alpha1"
	ethereumclient "bulutzincir/pkg/client/clientset/versioned/typed/ethereum/v1alpha1"

	"k8s.io/client-go/tools/cache"
)

// EthereumController represents a controller object for ethereum custom resources
type EthereumController struct {
	context           *bz.Context
	ethereumClientset ethereumclient.BulutzincirV1alpha1Interface
}

// newEthereumController create controller for watching ethereum custom resources created
func newEthereumController(context *bz.Context, ethereumClientset ethereumclient.BulutzincirV1alpha1Interface) *EthereumController {
	return &EthereumController{
		context:           context,
		ethereumClientset: ethereumClientset,
	}
}

// Watch watches for instances of Ethereum custom resources and acts on them
func (c *EthereumController) StartWatch(namespace string, stopCh chan struct{}) error {

	resourceHandlers := cache.ResourceEventHandlerFuncs{
		AddFunc:    c.onAdd,
		UpdateFunc: c.onUpdate,
		DeleteFunc: c.onDelete,
	}
	restClient := c.ethereumClientset.RESTClient()
	watcher := bz.NewWatcher(ethereum.EthereumResource, namespace, resourceHandlers, restClient)
	go watcher.Watch(&ethereum.Ethereum{}, stopCh)
	return nil
}

func (c *EthereumController) onAdd(obj interface{}) {
	s := obj.(*ethereum.Ethereum).DeepCopy()

	fmt.Printf("Added Ethereum '%s' with Hello=%s\n", s.Name, s.Spec.Hello)
}

func (c *EthereumController) onUpdate(oldObj, newObj interface{}) {
	oldEthereum := oldObj.(*ethereum.Ethereum).DeepCopy()
	newEthereum := newObj.(*ethereum.Ethereum).DeepCopy()

	fmt.Printf("Updated ethereum '%s' from %s to %s\n", newEthereum.Name, oldEthereum.Spec.Hello, newEthereum.Spec.Hello)
}

func (c *EthereumController) onDelete(obj interface{}) {
	s := obj.(*ethereum.Ethereum).DeepCopy()

	fmt.Printf("Deleted ethereum '%s' with Hello=%s\n", s.Name, s.Spec.Hello)
}
