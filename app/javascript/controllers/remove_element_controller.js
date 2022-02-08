import { Controller } from "@hotwired/stimulus";

/*
 * Usage
 * =====
 *
 * add data-controller="remove" to common ancestor
 *
 * Action (add this to your button):
 * data-action="remove#remove"
 *
 * Targets (add this to the item that should be removed):
 * data-toggle-target="removable"
 *
 */
export default class extends Controller {
  static targets = ["removable"];

  remove(e){
    this.removableTargets.forEach((target) => {
      target.parentNode.removeChild(target)
    });
  }
}