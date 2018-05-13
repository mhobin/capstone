var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: []
    };
  },
  created: function() {
    axios.get("/v1/products").then(function(response){
      this.products = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var ProductsShowPage = {
  template: "#products-show-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      product: {},
      addToCart: {quantity: ""},
      errors: []
    };
  },
  created: function() {
  
    axios.get("/v1/products/" + this.$route.params.id).then(
      function(response){
      this.product = response.data;
    }.bind(this));
  },
  methods: {
    addCart: function() {
      console.log(this.$route.params.id)
      // console.log(this.$route.params.current_child_user_id)
      var params = {
        inputProductId: this.$route.params.id,
        inputQuantity: this.addToCart.quantity
      };
      axios.post("/v1/carted_products", params).then(function(response){
        console.log(this.addToCart)
        this.addToCart = {quantity: ""};
        this.errors = [];
      }.bind(this)).catch(function(error){
        console.log(error.response.data.errors);
        this.errors = error.response.data.errors;
      }.bind(this));
    }
  },
  computed: {}
};

var CartedProductsPage = {
  template: "#carted-products-page",
  data: function() {
    return {
      message: "Cart",
      carted_products: {}
    };
  },
  created: function() {
    axios.get("/v1/carted_products").then(function(response){
      this.carted_products = response.data;
    }.bind(this));
  },
  methods: {
    submit: function() {
    axios.post("/v1/orders").then(function(response){
      this.carted_products = response.data;
    }.bind(this));
  }},
  computed: {}
};

var RequestsPage = {
  template: "#requests-page",
  data: function() {
    return {
      message: "Request",
      carted_products: {}
    };
  },
  created: function() {
    axios.get("/v1/requests").then(function(response){
      this.carted_products = response.data;
    }.bind(this));
  },
  methods: {
    submit: function() {
    axios.post("/v1/orders").then(function(response){
      this.carted_products = response.data;
    }.bind(this));
  }},
  computed: {}
};


var ParentSignupPage = {
  template: "#parent-signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v1/parent_users", params)
        .then(function(response) {
          router.push("/parentlogin");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ChildSignupPage = {
  template: "#child-signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      parent_user_id: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        parent_user_id: this.parent_user_id,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v1/child_users", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ChildLoginPage = {
  template: "#child-login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/child_user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var ParentLoginPage = {
  template: "#parent-login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/parent_user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/requests");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var router = new VueRouter({
  routes: [
  { path: "/", component: HomePage },
  {path: "/childsignup", component: ChildSignupPage},
  {path: "/parentsignup", component: ParentSignupPage},
  {path: "/childlogin", component: ChildLoginPage},
  {path: "/parentlogin", component: ParentLoginPage},
  {path: "/products/:id", component: ProductsShowPage},
  {path: "/cartedproducts", component: CartedProductsPage},
  {path: "/requests", component: RequestsPage}
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
   created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});