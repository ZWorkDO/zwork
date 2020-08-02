<template>
    <section class="wt-haslayout" v-bind:style="{ background: contact_us_section.sectionColor}">
      <div class="container-fluid">
          <div class="row">
              <div v-if="contact_us_section.description" class="col-12 col-sm-12 col-md-12 col-lg-12" v-html="contact_us_section.description">
              </div>
              <div class="d-flex flex-wrap" v-bind:class="[ contact_us_section.full_width  ? 'container-fluid' : 'container']"> 
                <div v-if="contact_us_section.content" v-outer-html="contact_us_section.content"></div>
                <div class="flex-fill" style="flex-basis: 30% !important;">
                  <form method="POST" id="contact-us-form" class="wt-formtheme" @submit.prevent="submitContactUs()">
                        <fieldset>
                            <div class="form-group">
                                <input type="text" v-bind:placeholder="trans('lang.name')"  v-model="form.name" name="name" class="form-control" />
                            </div>
                            <div class="form-group">
                                <input type="email" v-bind:placeholder="trans('lang.email_address_short')"  v-model="form.email" name="email" class="form-control" />
                            </div>
                            <div class="form-group">
                                <textarea wi v-bind:placeholder="trans('lang.ph_type_msg')" v-model="form.message" name="message" class="form-control" />
                            </div>
                            <div class="form-group wt-btnarea">
                                <input type="submit" class="wt-btn" v-bind:value="trans('lang.btn_submit')">
                            </div>
                        </fieldset>
                    </form>
                </div>
              </div>
          </div>
      </div>
        
    </section>
</template>
<script>
import Editor from '@tinymce/tinymce-vue'
import vOuterHTML from 'v-outer-html'
Vue.directive('outer-html', vOuterHTML);

export default {
    components:{vOuterHTML},
    props:['parent_index', 'element_id', 'contact_us_sections'],
    data() {
        return {
            form: {
              name: '',
              email: '',
              message: '',
            },
            contact_us_section:{},
            notificationSystem: {
                options: {
                    success: {
                        position: "topRight",
                        timeout: 4000,
                        class: 'success_notification'
                    },
                    error: {
                        position: "topRight",
                        timeout: 4000,
                        class: 'error_notification'
                    },
                }
            },
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
        showMessage(message) {
          return this.$toast.success(' ', message, this.notificationSystem.options.success);
        },
        showError(error) {
          return this.$toast.error(' ', error, this.notificationSystem.options.error);
        },
        submitContactUs: function () {
          let contact_us_form = document.getElementById('contact-us-form');
          let form_data = new FormData(contact_us_form);
          var self = this;
          axios.post(APP_URL + '/contact-us', form_data)
              .then(function (response) {
                  if (response.data.type == 'success') {
                      self.form.name = '';
                      self.form.email = '';
                      self.form.message = '';
                      self.showMessage(response.data.message);
                  } else if (response.data.type == 'error') {
                      self.showError(response.data.message);
                  }
        
              })
              .catch(error => {
                  if (error.response.status == 422) {
                      if (error.response.data.errors.name) {
                          self.showError(error.response.data.errors.name[0]);
                      }
                      if (error.response.data.errors.email) {
                          self.showError(error.response.data.errors.email[0]);
                      }
                      if (error.response.data.errors.message) {
                        self.showError(error.response.data.errors.message[0]);
                      }
                  }
              });
        },
    },
    created: function() {
        var index = this.getArrayIndex(this.contact_us_sections, 'id', this.element_id)
        if (this.contact_us_sections[index]) {
            this.contact_us_section = this.contact_us_sections[index]      
        }        
    },
};
</script>
