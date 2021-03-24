<template>
    <div>
        <div class="wt-formtheme wt-categoryform wt-skillsform">
            <transition name="fade">
                <div v-if="isShow" class="sj-jump-messeges">{{ trans('lang.no_record') }}</div>
            </transition>
            <fieldset>
                <div >
                  
                        <span class="wt-select">
                            <select id="freelancer_category">
                                <option v-for="(stored_category, index) in stored_categories" :key="index" :value="stored_category.id">{{stored_category.title}}</option>
                            </select>
                        </span>
                 
                </div>
                <div class="form-group wt-btnarea">
                    <a href="javascript:void(0);" class="wt-btn-cat wt-btn" @click="addCategory">{{trans('lang.add_categories')}}</a>
                </div>
            </fieldset>
        </div>
        <div class="wt-mycategories wt-myskills">
            <ul id="category_list skill_list" class="sortable list">
                <li v-for="(freelancer_category, index) in freelancer_categories" :key="index" v-if="freelancer_categories" class="skill-element" :ref="'category-'+index">
                    <div class="wt-dragdroptool">
                        <a href="javascript:void(0)" class="lnr lnr-menu"></a>
                    </div>
                    <span class="category-dynamic-html skill-dynamic-html">
                        {{freelancer_category.title}}</span>
                    <span class="category-dynamic-field skill-dynamic-field sss">
                        <input type="hidden" v-bind:name="'skills['+index+'][id]'" :value="freelancer_category.id">
                    </span>
                    <div class="wt-rightarea">
                        <a href="javascript:void(0);" class="wt-deleteinfo delete-skill" @click="removeStoredCategory(index)"><i class="lnr lnr-trash"></i></a>
                    </div>
                </li>
                <li v-for="(category, index) in categories" :key="index+category.count">
                    <div class="wt-dragdroptool">
                        <a href="javascript:void(0)" class="lnr lnr-menu"></a>
                    </div>
                    <span class="category-dynamic-html skill-dynamic-html">{{category.title}} </span>
                    <span class="category-dynamic-field skill-dynamic-field">
                        <input type="hidden" v-bind:name="'categories['+[category.count]+'][id]'" :value="category.id">
                    </span>
                    <div class="wt-rightarea">
                        <a href="javascript:void(0);" class="wt-deleteinfo" @click="removeCategory(index)"><i class="lnr lnr-trash"></i></a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</template>
<style>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>
<script>
 export default{
    props: ['widget_title', 'ph_category'],
        data(){
            return {
                isShow: false,
                stored_skills:[],
                stored_categories:[],
                selected_skill: '',
                selected_rating:'',
                selected_skill_text:'',
                selected_category_text:'',
                selected_category:'',
                edit_class: false,
                edit_skill: '',
                skill: {
                    id: '',
                    rating: '',
                    title:'',
                    count: 0
                },
                category: {
                    id: '',
                    title:'',
                    count: 0
                },
                skills: [],
                categories: [],
                freelancer_skills: [],
                freelancer_categories: [],
                counts:0,
                notificationSystem: {
                    error: {
                        position: "topRight",
                        timeout: 4000
                    }
                },
            }
        },
        methods: {
            showError(error){
                return this.$toast.error(' ', error, this.notificationSystem.error);
            },
            getSkills(){
                let self = this;
                axios.get(APP_URL + '/get-freelancer-skills')
                .then(function (response) {
                    self.stored_skills = response.data.skills;
                });
            },
            getUserSkills(){
                let self = this;
                axios.get(APP_URL + '/freelancer/get-freelancer-skills')
                .then(function (response) {
                    self.freelancer_skills = response.data.freelancer_skills;
                });
            },
             getAllCategories(){
                let self = this;
                axios.get(APP_URL + '/get-freelancer-all-categories')
                .then(function (response) {
                      console.log('ALL-CATEGORIES');
                    console.log(response);
                    self.stored_categories = response.data.categories;
                });
            },
             getUserCategories(){
                let self = this;
                axios.get(APP_URL + '/freelancer/get-freelancer-categoties')
                .then(function (response) {
                    console.log('FREELANCER-CATEGORIES');
                    console.log(response);
                    self.freelancer_categories = response.data.freelancer_categories;
                    
 
                });
            },
            addCategory: function () {
                var categoriesSelect = document.getElementById("freelancer_category");
                if (categoriesSelect.value === "") {
                    this.showError('empty field not allow');
                } else {
                    var category_list_count = jQuery('.wt-btn-cat').parents('.wt-categoryform').next('.wt-mycategories').find('ul#category_list li').length;
                    category_list_count = category_list_count - 1;
                    this.category.count = category_list_count;
                    
                    if(categoriesSelect.options[categoriesSelect.selectedIndex]) {
                        this.selected_category_text = categoriesSelect.options[categoriesSelect.selectedIndex].text;
                        this.selected_category = document.getElementById("freelancer_category").value;

                        this.categories.push(Vue.util.extend({}, this.category, this.category.count++, this.category.title = this.selected_category_text, this.category.id = this.selected_category ))
                        categoriesSelect.remove(categoriesSelect.selectedIndex);
                    } else {
                        this.isShow = true;
                        var self = this;
                        setTimeout(function () {
                            self.isShow = false;
                        }, 3000);
                        
                    }
                }
            },
            removeCategory: function (index) {
                var self = this;
                this.$swal({
                    title: "Eliminar Categoría",
                    text: "Estás seguro?",
                    type: "Advertencia",
                    showCancelButton: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "Si",
                    cancelButtonText: "No",
                    closeOnConfirm: true,
                    closeOnCancel: true,
                    showLoaderOnConfirm: true
                  }).then((result) => {
                    var self = this;
                    if(result.value) {
                        let option = self.categories[index];
                        var select = document.getElementById("freelancer_category");
                        select.options[select.options.length] = new Option(option.title, option.id, false, false);
                        self.categories.splice(index, 1);
                        self.$swal('Eliminado', 'Categoría Eliminada', 'success')
                    } else {
                        this.$swal.close()
                    }
                  })
            },
            removeStoredCategory: function (index) {
                var self = this;
                this.$swal({
                    title: "Eliminar Categoría",
                    text: "Estás seguro?",
                    type: "Advertencia",
                    showCancelButton: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "Si",
                    cancelButtonText: "No",
                    closeOnConfirm: true,
                    closeOnCancel: true,
                    showLoaderOnConfirm: true
                  }).then((result) => {
                    var self = this;
                    if(result.value) {
                        let option = self.freelancer_categories[index];
                        //console.log(option);
                        var select = document.getElementById("freelancer_category");
                        select.options[select.options.length] = new Option(option.title, option.id, false, false);
                        self.freelancer_categories.splice(index, 1);
                        self.$swal('Eliminado', 'Categoría Eliminada', 'success')
                    } else {
                        this.$swal.close()
                    }
                  })
            },
            removeSkill: function (index) {
                var self = this;
                this.$swal({
                    title: "Delete Skill",
                    text: "Are you Sure?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "si",
                    cancelButtonText: "No",
                    closeOnConfirm: true,
                    closeOnCancel: true,
                    showLoaderOnConfirm: true
                  }).then((result) => {
                    var self = this;
                    if(result.value) {
                        let option = self.skills[index];
                        var select = document.getElementById("freelancer_skill");
                        select.options[select.options.length] = new Option(option.title, option.id, false, false);
                        self.skills.splice(index, 1);
                        self.$swal('Deleted', 'Skill Deleted', 'success')
                    } else {
                        this.$swal.close()
                    }
                  })
            },
            removeStoredSkill: function (index) {
                var self = this;
                this.$swal({
                    title: "Delete Skill",
                    text: "Are you Sure?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "si",
                    cancelButtonText: "No",
                    closeOnConfirm: true,
                    closeOnCancel: true,
                    showLoaderOnConfirm: true
                  }).then((result) => {
                    var self = this;
                    if(result.value) {
                        let option = self.freelancer_skills[index];
                        //console.log(option);
                        var select = document.getElementById("freelancer_skill");
                        select.options[select.options.length] = new Option(option.title, option.id, false, false);
                        self.freelancer_skills.splice(index, 1);
                        self.$swal('Deleted', 'Skill Deleted', 'success')
                    } else {
                        this.$swal.close()
                    }
                  })
            },
            editInput: function (index) {
                this.edit_class = true;
            }
        },
        mounted: function () {
            jQuery(document).on('click', '.wt-addinfo-cat', function (e) {
                e.preventDefault();
                var _this = jQuery(this);
                _this.addClass('wt-categoriesactive');
                _this.parents('li').addClass('wt-categoriessaddinfo');
            });
            jQuery(document).on('click', '.wt-categoriesactive', function (e) {
                e.preventDefault();
                var _this = jQuery(this);
                _this.removeClass('wt-categoriesactive');
                _this.parents('li').removeClass('wt-categoriessaddinfo');
                var edit_skill_value = _this.parents('li').find('.category-dynamic-field input:text').val();
                _this.parents('li').find('.category-dynamic-html em').html(edit_skill_value);
            });
        },
        created: function() {
            this.getSkills();
            this.getUserSkills();
            this.getAllCategories();
            this.getUserCategories();
        } 
    }
</script>