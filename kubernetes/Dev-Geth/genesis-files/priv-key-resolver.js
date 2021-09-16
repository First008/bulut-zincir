var keythereum = require("keythereum");
var datadir = "/home/orta/Documents/bulut-zincir/kubernetes/imti-geth/genesis-files";
var address= "0x8E24c067e098c2DaDF28aec75A551257d2C9316f";
const password = "qwer";

var keyObject = keythereum.importFromFile(address, datadir);
var privateKey = keythereum.recover(password, keyObject);
console.log(privateKey.toString('hex'));