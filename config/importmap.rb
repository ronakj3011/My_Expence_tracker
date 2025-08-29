# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/ujs", to: "https://cdn.jsdelivr.net/npm/@rails/ujs@7.0.0-rc1/dist/rails-ujs.js"
pin "@hotwired/turbo-rails", to: "https://cdn.jsdelivr.net/npm/@hotwired/turbo-rails@7.0.0/dist/turbo.min.js"
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
