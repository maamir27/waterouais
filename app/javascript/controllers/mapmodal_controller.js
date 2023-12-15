import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      zoom: 12,
      center: [-73.561668, 45.508888]
    });


    // Add geolocate control to the map.
    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        // When active the map will receive updates to the device's location as it changes.
        trackUserLocation: true,
        // Draw an arrow next to the location dot to indicate which direction the device is heading.
        showUserHeading: true
      })
    )

    const pinLocationButton = document.querySelector(".geo-btn")
    const addressField = document.querySelector("#station_address")
    const mapModal = document.querySelector(".modal fade")

    pinLocationButton.addEventListener("click", function(event) {
      event.preventDefault();
      navigator.geolocation.getCurrentPosition((position) => {
        const longitude = position.coords.longitude;
        const latitude = position.coords.latitude;
        const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${longitude},${latitude}.json?types=address&access_token=pk.eyJ1IjoidHJpc2hiYWVuYSIsImEiOiJjbG1jZDR5NzcxNGRpM2ltc2V1OTdwdmtpIn0.uNJ_0ig9mysqEafWSv7ryA`;

        const reverseGeocode = () => {
          fetch(url)
            .then(response => response.json())
            .then((data) => {
              addressField.value = data.features[0].place_name;
            })
        }
        reverseGeocode();
      });

    })
  }
}
