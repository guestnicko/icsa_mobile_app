import functions from "firebase-functions";
import admin from "firebase-admin";

admin.initializeApp();

export const sayHello = functions.https.onCall((data, context) => {
  const name = data["name"] || "Guest";
  return { message: `Hello, ${name}!` };
});
