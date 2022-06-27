const callback = function() {
  // Need to remove any trailing forward slashes to ensure old links will resolve to new scheme
  if (location.href.endsWith('/')) {
      location.href = location.href.substring(0, location.href.length - 1);
  }
};

if (document.readyState === "complete" || document.readyState === "interactive") {
  setTimeout(callback, 1);
} else {
  document.addEventListener("DOMContentLoaded", callback);
}
