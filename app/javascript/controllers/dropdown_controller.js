import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static targets = ["menu"];

	select() {
		const selected = this.menuTarget.value;
		window.location.href =
			"/companies?province=" + selected.toLowerCase().replaceAll(" ", "_");
	}
}
