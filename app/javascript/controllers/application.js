import { Application } from "@hotwired/stimulus"
import Popover from 'stimulus-popover'

const application = Application.start()
application.register('popover', Popover)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
