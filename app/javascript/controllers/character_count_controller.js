import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["source", "display", "notice"]

  connect() {
    this.updateCount()
  }

  update() {
    this.displayTarget.textContent =
      `${this.sourceTarget.value.length} / 100`
  }

  updateCount() {
    const count = this.sourceTarget.value.length
    const max = this.sourceTarget.getAttribute("maxlength")
    this.displayTarget.textContent = `${count} / ${max}`
  }

  sourceTargetConnected(element) {
    element.addEventListener("input", this.updateCount.bind(this))
  }

  sourceTargetDisconnected(element) {
    element.removeEventListener("input", this.updateCount.bind(this))
  }

 

  reset(event) {
  // notice が存在しない画面では何もしない
  if (!this.hasNoticeTarget) {
    // textarea と文字数だけは成功時にリセット
    if (event.detail.success) {
      this.sourceTarget.value = ""
      this.displayTarget.textContent = "0 / 100"
    }
    return
  }

  // ===== 失敗時 =====
  if (!event.detail.success) {
    this.noticeTarget.style.display = "none"
    return
  }

  // ===== 成功時 =====
  this.sourceTarget.value = ""
  this.displayTarget.textContent = "0 / 100"

  this.noticeTarget.style.display = "inline"
  this.noticeTarget.style.visibility = "visible"
  this.noticeTarget.classList.add("show")

  // 1.5秒後に消す
  setTimeout(() => {
    this.noticeTarget.classList.remove("show")
    this.noticeTarget.style.display = "none"
  }, 1500)
}

}


