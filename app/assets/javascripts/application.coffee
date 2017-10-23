#= require jquery
#= require bootstrap-sprockets
#= require rails-ujs


String::capitalize = ->
	"#{this[0].toUpperCase()}#{this.substr 1}";

@App = window.App || {}

# wrapper around $.ajax
App.Request = $.ajax

# config variables
App.config =
	api_base: '/api/v1'

$ ->
	$body = $ document.body
	controller = $body.data 'controller'
	action = $body.data 'action'

	try
		new App["#{controller.capitalize()}#{action.capitalize()}"]
	catch e
		console.error e

#= require_tree .

# model base class
class ModelBase
	@authHeader: ->
		headers =
			Authorization: "Bearer #{localStorage.getItem 'token'}"

	constructor: (@attributes = {}) ->
		# default constructor

# user model class
class App.UserModel extends ModelBase
	attributes:
		id: 0
		name: ''
		email: ''

	@load: ->
		return App.Request
			url: "#{App.config.api_base}/user-profile"
			method: 'GET'
			type: 'json'
			headers: ModelBase.authHeader()
			dataType: 'json'

	@cached: ->
		JSON.parse (localStorage.getItem 'user')

# schedule model class
class App.ScheduleModel extends ModelBase
	attributes:
		user_id: 0
		room_id: 0
		description: ''
		starts_at: ''
		ends_at: ''

	@all: ->
		return App.Request
			url: "#{App.config.api_base}/user-profile"
			method: 'GET'
			type: 'json'
			headers: ModelBase.authHeader()
			dataType: 'json'

	@load: (id) ->
		return App.Request
			url: "#{App.config.api_base}/user-profile/#{id}"
			method: 'GET'
			type: 'json'
			headers: ModelBase.authHeader()
			dataType: 'json'

	@delete: (id) ->
		return App.Request
			url: "#{App.config.api_base}/user-profile"
			method: 'DELETE'
			type: 'json'
			headers: ModelBase.authHeader()
			dataType: 'json'


# base class for components
class ComponentBase
	el: ($ document.body)

	config: App.config

	constructor: -> @bind()

	disableButton: (buttonSelector) ->
		(@el.find buttonSelector).attr 'disabled', 'disabled'

	enableButton: (buttonSelector) ->
		(@el.find buttonSelector).removeAttr 'disabled'

# schedule table component
class App.ScheduleTable extends ComponentBase
	el: ($ 'table#schedule-table')

	collections:
		schedules: []

	bind: ->
		@loadSchedules()

		@el.on 'click', '.js-add-schedule', (e) =>
			@scheduleRoom(e)

		false

	scheduleRoom: (e) ->
		console.log e
		return false unless confirm 'Confirmar este horário para utilizar sala?'

		scheduleModel = App.ScheduleModel.all()
		
		scheduleModel.done (json) =>
			console.log json

		scheduleModel.error (json) =>
			console.log json

		false

	loadSchedules: ->
		scheduleModel = App.ScheduleModel.all()
		
		scheduleModel.done (json) =>
			console.log json

		scheduleModel.error (json) =>
			console.log json

		false

	scheduleParams: ->
		user = App.UserModel.cached()
		params =
			user_id: user





class App.UserNavbar extends ComponentBase
	el: ($ 'nav')

	bind: ->
		@loadUser()

		@el.on 'click', '.js-auth-signout', (e) =>
			@userAuthSignout(e)

		false

	userAuthSignout: (e) ->
		localStorage.removeItem 'token'
		document.location = '/auth/signin?notice=goodbye'
		false

	loadUser: ->
		userModel = App.UserModel.load()
		
		userModel.done (json) =>
			localStorage.setItem 'user', JSON.stringify json

			@el.find '#user-avatar'
				.attr 'src', json.profile_image
				.attr 'height', '30px'

			@el.find '#user-name'
				.html json.name

		userModel.error (res) =>
			document.location = '/auth/signin?notice=unauthenticated'
		
		false


# home index component
class App.HomeIndex extends ComponentBase
	el: ($ 'section#home-section')

	bind: ->
		# load user informations
		@loadUser()

		# load schedules informations
		@loadSchedules()


	loadUser: ->
		new App.UserNavbar
		false

	loadSchedules: ->
		new App.ScheduleTable
		false



# auth signin component
class App.AuthSignin extends ComponentBase
	el: ($ 'form.signin-form')

	bind: ->
		@el.on 'submit', (e) => @signinFormSubmit e

	signinFormSubmit: (e) ->
		@disableButton 'button[type=submit]'

		signin = App.Request
			url: "#{@config.api_base}/user-token"
			method: 'POST'
			type: 'json'
			data: {auth: @signinParams()}
			dataType: 'json'

		signin.done (json) =>
			(localStorage.setItem 'token', json.jwt || undefined)
			document.location = '/?notice=welcome'
			
		signin.error (res) =>
			alert 'Usuário ou senha inválidos'
		
		signin.complete =>
			@enableButton 'button[type=submit]'

		false

	signinParams: ->
		params =
			email: (@el.find '#email').val()
			password: (@el.find '#password').val()

	
