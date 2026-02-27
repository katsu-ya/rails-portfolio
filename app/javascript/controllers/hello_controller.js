import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["output"];
  counter = 0;

  connect() {
    console.log("Hello controller connected!");
    this.outputTarget.textContent = "Hello World!";
  }

  doit() {
    this.counter++;
    this.outputTarget.textContent = "clicked " + this.counter + " times!";
  }
}
