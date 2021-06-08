const app = Vue.createApp({
	data() {
		return {
			state: 1,
			murder: false
		}
	}
})

const vm = app.mount('#root')

Events.Subscribe("ChangeState", function(state) {
	console.log(state);
	vm.state = state;
})

Events.Subscribe("SetMurderer", function(murder) {
	vm.murder = murder;
})
