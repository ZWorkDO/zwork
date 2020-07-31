<template>
    <section class="wt-haslayout" v-bind:style="{ background: gmap.sectionColor}">
      <GmapMap 
      style="width: 100%; height: 600px;" :zoom="18" :center="{lat: parseFloat(gmap.latitude), lng: parseFloat(gmap.longitude)}"
          ref="map">
        <GmapMarker v-for="(marker, index) in markers"
          :key="index"
          :position="marker.latLng"
          @click="toggleInfoWindow(marker,index)"
          />
          <gmap-info-window
            :options="infoOptions"
            :position="infoWindowPos"
            :opened="infoWinOpen"
            @closeclick="infoWinOpen=false"
          >
            <div v-html="infoContent"></div>
          </gmap-info-window>
      </GmapMap>
    </section>
</template>
<script>
import Editor from '@tinymce/tinymce-vue'

export default {
    props:['parent_index', 'element_id', 'maps'],
    data() {
        return {
            gmap:{},
            markers: [],
            place: null,
            infoContent: '',
            infoWindowPos: {
              lat: 0,
              lng: 0
            },
            infoWinOpen: false,
            currentMidx: null,
            //optional: offset infowindow so it visually sits nicely on top of our marker
            infoOptions: {
              pixelOffset: {
                width: 0,
                height: -35
              }
            },
        }
    },
    description: `
    In which a random set of points are generated, and
    the bounds of the map are changed to fit the points
    `,
    watch: {
        markers(markers) {
        if (markers.length > 2) {
            const bounds = new google.maps.LatLngBounds()
            for (let m of markers) {
            bounds.extend(m.latLng)
            }
            this.$refs.map.fitBounds(bounds)
        }
        }
    },
    methods:{
        getArrayIndex (array, attr, value) {
            for (var i = 0; i < array.length; i += 1) {
                if (array[i][attr] == value) {
                return i
                }
            }
            return -1
        },
        removeSection: function() {
            this.$emit("removeElement", 'remove-section');
        },
        generate() {
          const spread = Math.random() + 0.001
          this.center = {
              lat: 1.38 + (Math.random() - 0.5) * spread,
              lng: 103.8 + (Math.random() - 0.5) * spread,
          }
          this.markers = _.range(30)
            .map(m => ({
            latLng: {
                lat: this.center.lat + (Math.random() - 0.5) * spread,
                lng: this.center.lng + (Math.random() - 0.5) * spread,
            }
            }))
        },
        toggleInfoWindow: function (marker, idx) {
          this.infoWindowPos = marker.latLng;
          this.infoContent = this.getInfoWindowContent(marker);
          

          //check if its the same marker that was selected if yes toggle
          if (this.currentMidx == idx) {
            this.infoWinOpen = !this.infoWinOpen;
          }
          //if different marker set infowindow to open and reset current marker index
          else {
            this.infoWinOpen = true;
            this.currentMidx = idx;
          }
        },
        getInfoWindowContent: function (marker) {
          return (`<div class="info-window">
                    <div class="info-window-content">
                      <p class="title is-4"><strong>${marker.name}</strong></p>
                      <div class="content">
                        ${marker.description}
                      </div>
                    </div>
                  </div>`);
        },
    },
    created: function() {
        var index = this.getArrayIndex(this.maps, 'id', this.element_id)
        if (this.maps[index]) {
            this.gmap = this.maps[index]
            let marker = {
              lat: parseFloat(this.gmap.latitude),
              lng: parseFloat(this.gmap.longitude)
            };
            this.markers.push({ 
              name: this.gmap.title,
              description: this.gmap.description,
              latLng: marker
            });            
        }        
    },
};
</script>
