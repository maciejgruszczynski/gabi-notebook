import { Controller } from "@hotwired/stimulus";

/*
 * Usage
 * =====
 *
 * add data-controller="toggle" to common ancestor
 *
 * Action (add this to your button):
 * data-action="toggle#toggle"
 *
 * Targets (add this to the item to be shown/hidden):
 * data-toggle-target="toggleable" data-css-class="class-to-toggle"
 *
 */
export default class extends Controller {
  static targets = ["toggleable"];

  toggle(e) {
    e.preventDefault();

    this.toggleableTargets.forEach((target) => {
      target.classList.toggle(target.dataset.cssClass);
    });
  }
}