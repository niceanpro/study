
var appaa = new Vue({
	el: '#app',
	data: {
		message: '안재환!  Hello Vue!'
	}
})


var app2 = new Vue({
	el: '#app-2',
	data: {
		message: '이 페이지는 ' + new Date() + ' 에 로드 되었습니다'
	}
})


var app3 = new Vue({
	el: '#app-3',
	data: {
		seen: true
	}
})


var app4 = new Vue({
	el: '#app-4',
	data: {
	todos: [
		{ text: 'JavaScript 배우기' },
		{ text: 'Vue 배우기' },
		{ text: '무언가 멋진 것을 만들기' }
		]
	}
})


var app5 = new Vue({
	el: '#app-5',
	data: {
		message: '안녕하세요! Vue.js!'
	},
	methods: {
		reverseMessage: function () {
			this.message = this.message.split('').reverse().join('')
		}
	}
})


var app6 = new Vue({
	el: '#app-6',
	data: {
		message: '안녕하세요 Vue!'
	}
})

