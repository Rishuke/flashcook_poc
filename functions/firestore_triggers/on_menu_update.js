const functions = require("firebase-functions");
const admin = require("firebase-admin");

module.exports = functions.firestore
  .document("menus/{menuId}")
  .onUpdate(async (change, context) => {
    const after = change.after.data();
    const before = change.before.data();
    const ref = change.after.ref;

    if (after.updatedAt?.toMillis() !== before.updatedAt?.toMillis()) {
      return null;
    }

    functions.logger.info(`Updating updatedAt for menuId: ${context.params.menuId}`);

    try {
      await ref.update({
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      });
      functions.logger.info(`updatedAt set successfully for menuId: ${context.params.menuId}`);
    } catch (error) {
      console.error(`Error updating updatedAt for menuId: ${context.params.menuId}`, error);
    }

    return null;
  });
