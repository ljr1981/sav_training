note
	description: "[
				This class implements the `Hello World' execution service.
				It inherits from WSF_ROUTED_EXECUTION to use the router service
				and from WSF_ROUTED_URI_TEMPLATE_HELPER to use help feature to map
					uri-template routes
			]"

class
	HELLO_EXECUTION

inherit
	WSF_ROUTED_EXECUTION

	WSF_ROUTED_URI_HELPER

	WSF_ROUTED_URI_TEMPLATE_HELPER

create
	make

feature {NONE} -- Initialization

	setup_router
		do
			map_uri_agent ("/hello", agent execute_hello (?, ?), Void)
			map_uri_template ("/users/{user}/message/{mesgid}", create {USER_MESSAGE_HANDLER}, router.methods_HEAD_GET_POST)
			map_uri_template ("/users/{user}/message/", create {USER_MESSAGE_HANDLER}, router.methods_GET_POST)
			map_uri_template_response_agent ("/users/{user}/{?op}", agent response_user (?), router.methods_GET)
		end

feature -- Execution

	execute_hello (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Computed response message.
		local
			l_response: WSF_HTML_PAGE_RESPONSE
			l_response_html: STRING_8
			l_user_name: READABLE_STRING_32
		do
			--| It is now returning a WSF_HTML_PAGE_RESPONSE
			--| Since it is easier for building html page
			create l_response.make
			l_response.set_title ("EWF tutorial / Hello World!")
			--| Check if the request contains a parameter named "user"
			--| this could be a query, or a form parameter
			if attached {WSF_STRING} a_request.item ("user") as al_user then
				--| If yes, say hello world #name

				l_user_name := (create {HTML_ENCODER}).decoded_string (al_user.value)

				l_response_html := "<p>Hello " + l_response.html_encoded_string (l_user_name) + "!</p>"
				l_response_html.append ("Display a <a href=%"/users/" + al_user.url_encoded_value + "/message/%">message</a></p>")
				l_response_html.append ("<p>Click <a href=%"/users/" + al_user.url_encoded_value + "/?op=quit%">here</a> to quit.</p>")
				l_response.set_body (l_response_html)
				--| We should html encode this name
				--| but to keep the example simple, we don't do that for now.
			else
				--| Otherwise, ask for name
				l_response_html := (create {HTML_ENCODER}).encoded_string ({STRING_32} "Hello / ahoj / नमस्ते / Ciào / مرحبا / Hola / 你好 / Hallo / Selam / Bonjour ")
				l_response_html.append ("[
							<form action="/hello" method="GET">
								What is your name?</p>
								<input type="text" name="user"/>
								<input type="submit" value="Validate"/>
							</form>
						]"
					)
				l_response.set_body (l_response_html)
			end

			--| note:
			--| 1) Source of the parameter, we could have used
			--|		 req.query_parameter ("user") to search only in the query string
			--|		 req.form_parameter ("user") to search only in the form parameters
			--| 2) response type
			--| 	it could also have used WSF_PAGE_REPONSE, and build the html in the code
			--|

			a_response.send (l_response)
		end

	response_user (a_request: WSF_REQUEST): WSF_RESPONSE_MESSAGE
			-- Computed response message.
		local
			l_html_response: WSF_HTML_PAGE_RESPONSE
			l_redirection_response: WSF_HTML_DELAYED_REDIRECTION_RESPONSE
			l_html_text: STRING_8
			l_username: STRING_32
		do
			if attached {WSF_STRING} a_request.path_parameter ("user") as al_user then
				l_username := (create {HTML_ENCODER}).general_decoded_string (al_user.value)
				if
					attached {WSF_STRING} a_request.query_parameter ("op") as al_operation
				then
					if al_operation.is_case_insensitive_equal ("quit") then
						create l_redirection_response.make (a_request.script_url ("/hello"), 3)
						create l_html_response.make
						l_redirection_response.set_title ("Bye " + l_html_response.html_encoded_string (l_username))
						l_redirection_response.set_body ("Bye " + l_html_response.html_encoded_string (l_username) + ",<br/> see you soon.<p>You will be redirected to " +
										l_redirection_response.url_location + " in " + l_redirection_response.delay.out + " second(s) ...</p>"
								)
						Result := l_redirection_response
					else
						create l_html_response.make
						l_html_response.set_title ("Bad request")
						l_html_response.set_body ("Bad request: unknown operation '" + al_operation.url_encoded_value + "'.")
						Result := l_html_response
					end
				else
					create l_html_response.make

					l_html_text := "<p>User <em>'" + l_html_response.html_encoded_string (l_username)  + "'</em>!</p>"
					l_html_text.append ("Display a <a href=%"/users/" + al_user.url_encoded_value + "/message/%">message</a></p>")
					l_html_text.append ("<p>Click <a href=%"/users/" + al_user.url_encoded_value + "/?op=quit%">here</a> to quit.</p>")
					l_html_response.set_title ("User '" + al_user.url_encoded_value + "'")
					l_html_response.set_body (l_html_text)
					Result := l_html_response
				end
			else
				create l_html_response.make
				l_html_response.set_title ("Bad request")
				l_html_response.set_body ("Bad request: missing user parameter")
				Result := l_html_response
			end
		end

end
