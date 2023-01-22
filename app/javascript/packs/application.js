// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// 以下24章
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application" 
// 以上24章
import '@fortawesome/fontawesome-free/js/all'// 24章

Rails.start()
Turbolinks.start()
ActiveStorage.start()
