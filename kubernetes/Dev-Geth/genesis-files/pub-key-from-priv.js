const privateKeyToPublicKey = require('ethereum-private-key-to-public-key')
 
console.log(privateKeyToPublicKey('383c13ad301f0879ff5ff26355377c386f23cbfa3832273593350a5eb1129bb4').toString('hex'))
console.log(privateKeyToPublicKey('6c429aea17cdae0ea1a9de40455244ab8e9e79b887cf65897f1c2d86604f634a').toString('hex'))
console.log(privateKeyToPublicKey('a9e81443dc8e8054774d1e7321f43c1fe1699788e1ee7289f650cb8f7d4d563a').toString('hex'))