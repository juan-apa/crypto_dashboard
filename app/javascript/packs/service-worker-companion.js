// Use feature-detection to check for ES6 support.
function browserSupportsES6() {
  try { eval("var foo = (x)=>x+1"); }
  catch (e) { return false; }
  return true;
}

if (browserSupportsES6() && ('caches' in window) && ('serviceWorker' in navigator)) {
  navigator.serviceWorker.register('/service-worker.js')
  .then(registration => {    
    var serviceWorker;
    if (registration.installing) {
      serviceWorker = registration.installing;
    } else if (registration.waiting) {
      serviceWorker = registration.waiting;
    } else if (registration.active) {
      serviceWorker = registration.active;
    }
  }).catch(registrationError => {
    console.error('Service worker registration failed: ', registrationError);
  });
}
