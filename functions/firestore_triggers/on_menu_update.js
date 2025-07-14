const {onDocumentUpdated} = require("firebase-functions/v2/firestore");
const {getFirestore, FieldValue} = require("firebase-admin/firestore");
const {initializeApp} = require("firebase-admin/app");

initializeApp(); 

exports.onMenuUpdate = onDocumentUpdated("menus/{menuId}", async (event) => {
  const doc = event.data;
  const ref = getFirestore().doc(`menus/${event.params.menuId}`);

  if (!doc) return;

  const before = doc.before.data();
  const after = doc.after.data();

  if (!before || !after) return;

  if (before.updatedAt?.toMillis() !== after.updatedAt?.toMillis()) return;

  console.log(`Updating updatedAt for menuId: ${event.params.menuId}`);
  try {
    await ref.update({
      updatedAt: FieldValue.serverTimestamp(),
    });
    console.log(`updatedAt set successfully for menuId: ${event.params.menuId}`);
  } catch (error) {
    console.error(`Error updating updatedAt for menuId: ${event.params.menuId}`, error);
  }
});
