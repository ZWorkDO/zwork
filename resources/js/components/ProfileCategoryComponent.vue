<template>
    <div>
        <div class="wt-formtheme wt-categoryform">
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
        <div class="wt-mycategories">
            <ul id="category_list" class="sortable list">
                <li v-for="(freelancer_category, index) in freelancer_categories" :key="index" v-if="freelancer_categories" class="category-element" :ref="'category-'+index">
                    <div class="wt-dragdroptool">
                        <a href="javascript:void(0)" class="lnr lnr-menu"></a>
                    </div>
                    <span class="category-dynamic-html">
                        {{freelancer_category.title}}</span>
                    <span class="category-dynamic-field sss">
                        <input type="hidden" v-bind:name="'categories['+index+'][id]'" :value="freelancer_category.id">
                    </span>
                    <div class="wt-rightarea">
                        <a href="javascript:void(0);" class="wt-deleteinfo delete-category" @click="removeStoredCategory(index)"><i class="lnr lnr-trash"></i></a>
                    </div>
                </li>
                <li v-for="(category, index) in categories" :key="index+category.count">
                    <div class="wt-dragdroptool">
                        <a href="javascript:void(0)" class="lnr lnr-menu"></a>
                    </div>
                    <span class="category-dynamic-html">{{category.title}} </span>
                    <span class="category-dynamic-field">
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
                stored_categories:[],
                selected_category_text:'',
                selected_category:'',
                category: {
                    id: '',
                    title:'',
                    count: 0
                },
                categories: [],
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
             getAllCategories(){
                let self = this;
                axios.get(APP_URL + '/get-freelancer-all-categories')
                .then(function (response) {
                    self.stored_categories = response.data.categories;
                });
            },
             getUserCategories(){
                let self = this;
                axios.get(APP_URL + '/freelancer/get-freelancer-categoties')
                .then(function (response) {      
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
                    type: "error",
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
                    type: "error",
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
            });
        },
        created: function() {
            this.getAllCategories();
            this.getUserCategories();
        } 
    }
</script>