// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDFTfNVkA0HfMRHRbIxYDkqp-n9_kGeMiQ",
  authDomain: "take-my-tym.firebaseapp.com",
  projectId: "take-my-tym",
  storageBucket: "take-my-tym.appspot.com",
  messagingSenderId: "895129544275",
  appId: "1:895129544275:web:8f7a749a94699be1efc8a6",
  measurementId: "G-L59JR5P0H1"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
