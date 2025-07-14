const functions = require("firebase-functions");
const admin = require("firebase-admin");



exports.onMenuUpdate = require("./firestore_triggers/on_menu_update");

// Si tu veux tester un endpoint HTTP plus tard
// exports.helloWorld = functions.https.onRequest((req, res) => {
//   res.send("Hello from Firebase Functions!");
// });
