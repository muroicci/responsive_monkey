module.exports = (grunt) ->

	grunt.initConfig 

		browserify:
			dist:
				files: 'dist/js/main.js': ["src/main.coffee"] 
				options:
					transform: ['coffeeify']
					shim:
							
						jQuery:
							path: 'src/libs/jquery-2.0.3.min.js'
							exports: 'jQuery'

						TweenLite:
							path: 'src/libs/TweenLite.min.js'
							exports: 'TweenLite'
						CSSPlugin:
							path: 'src/libs/CSSPlugin.min.js'
							exports: ''
						EasePack:
							path: 'src/libs/EasePack.min.js'
							exports: ''


		coffee:
			compile:
				options:
					bare: true

		coffeelint:
			app: ['src/*.coffee']
			tests:
				options:
					'no_trailing_whitespace':
						'level': 'error'

		compass:
			options:
				sassDir: 'src/sass'
				cssDir: 'dist/css'
				imagesDir: 'src/images'
				generatedImagesDir: 'dist/img'
				httpGeneratedImagesPath: '/img'

			debug:
				sourcemap: true
				debugInfo: false
				environment: 'development'
				noLineComments: true
				outputStyle: 'expanded'




		watch: 
			html:
				files: ['dist/*']

			scripts: 
				files: ['Gruntfile.coffee', 'src/*.coffee', 'src/sass/*.scss']
				tasks: ['browserify', 'coffee', 'compass']

			options:
				livereload: true

		connect:
			server:
				options:
					base: 'dist'




	grunt.loadNpmTasks('grunt-browserify')
	grunt.loadNpmTasks('grunt-contrib-coffee')
	grunt.loadNpmTasks('grunt-coffeelint')
	grunt.loadNpmTasks('grunt-contrib-compass')
	grunt.loadNpmTasks('grunt-contrib-connect')
	grunt.loadNpmTasks('grunt-contrib-watch')
	grunt.loadNpmTasks('grunt-contrib-uglify')

	# grunt.registerTask('default', ['connect', 'browserify', 'coffee', 'uglify', 'compass', 'watch'])
	grunt.registerTask('default', ['connect', 'browserify', 'coffee', 'compass', 'watch'])

