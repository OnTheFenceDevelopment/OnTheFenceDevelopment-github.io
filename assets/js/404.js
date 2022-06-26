const callback = function() {
    if (location.href.endsWith('/')) {
        location.href = location.href.substring(0, location.href.length - 1);
    }
};

if (document.readyState === "complete" || document.readyState === "interactive") {
  setTimeout(callback, 1);
} else {
  document.addEventListener("DOMContentLoaded", callback);
}
