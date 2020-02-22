
var initToggleForm = () => {
  window.toggleForm = function() {
    var ingredientForm = document.getElementById("ingredient-form");
    if (ingredientForm.style.display === "block") {
      ingredientForm.style.display = "none";
    } else {
      ingredientForm.style.display = "block";
    }
  }
}


export { initToggleForm };
