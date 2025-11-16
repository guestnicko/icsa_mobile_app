const functions = require("firebase-functions");
const admin = require("firebase-admin");
const db = admin.firestore();
const studentsRef = db.collection("students");
// CREATE student
exports.createStudent = functions.https.onCall(async (data, context) => {
  const { name, course, yearLevel } = data;

  if (!name || !course) {
    throw new functions.https.HttpsError(
      "invalid-argument",
      "Missing required fields."
    );
  }

  const doc = await studentsRef.add({
    name,
    course,
    yearLevel,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
  });

  return { id: doc.id };
});

// UPDATE student
exports.updateStudent = functions.https.onCall(async (data, context) => {
  const { id, name, course, yearLevel } = data;

  if (!id) {
    throw new functions.https.HttpsError("invalid-argument", "Missing id.");
  }

  await studentsRef.doc(id).update({
    name,
    course,
    yearLevel,
    updatedAt: admin.firestore.FieldValue.serverTimestamp(),
  });

  return { success: true };
});

// DELETE student
exports.deleteStudent = functions.https.onCall(async (data, context) => {
  const { id } = data;

  if (!id) {
    throw new functions.https.HttpsError("invalid-argument", "Missing id.");
  }

  await studentsRef.doc(id).delete();
  return { success: true };
});
