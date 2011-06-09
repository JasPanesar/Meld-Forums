<cfcomponent extends="controller">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="fw" type="struct" required="false" default="#StructNew()#">
		<cfset variables.fw = fw />
		
		<cfreturn this />
	</cffunction>

	<cffunction name="default" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var mmUtility	= getBeanFactory().getBean('mmUtility') />
		<cfset var bean			= "" />
		<cfset var MFEvent		= rc.mmEvents.createEvent( rc.$ ) />
		<cfset var cleanEvent	= "" />

		<cfif not StructKeyExists(url,"event")>
			<cfif len(cgi.http_referer)>	
				<cflocation url="#cgi.http_referer#?ecode=2500" addtoken="false" />
			<cfelse>
				<cflocation url="#rc.MFBean.getForumWebRoot()#" addtoken="false" />
			</cfif>
			<cfreturn />
		</cfif>
		
		<cfset cleanEvent	= rereplace(url.event,"[^[:alnum:]]","","all") />
		<cfset MFEvent.setValue('event',cleanEvent) />
		<cfset MFEvent.setValue('MFBean',rc.MFBean) />
		<cfset MFEvent.setValue('relocate',true) />
		<cfset MFEvent.setValue('relocateURL',"") />
		
		<cfloop collection="#url#" item="iiX">
			<cfif isSimpleValue(url[iiX]) and left(url[iiX],1) eq "_">
				<cfset MFEvent.setValue(iiX,url[iiX]) />
			</cfif>
		</cfloop>
		
		<cfif StructKeyExists(url,"type") and  StructKeyExists(url,"id") and mmUtility.isUUID(url.id)>
			<cfset MFEvent.setValue('type',url.type) />
			<cfset MFEvent.setValue('id',url.id) />

			<cfswitch expression="#url.type#">
				<cfcase value="conference">
					<cfset bean = getBeanFactory().getBean('conferenceService').getBeanByAttributes(conferenceID=url.id) />
					<cfif bean.beanExists()>
						<cfset MFEvent.setValue('conferenceBean',bean) />
					</cfif>
				</cfcase>
				<cfcase value="forum">
					<cfset bean = getBeanFactory().getBean('forumService').getBeanByAttributes(forumID=url.id) />
					<cfif bean.beanExists()>
						<cfset MFEvent.setValue('forumBean',bean) />
					</cfif>
				</cfcase>
				<cfcase value="thread">
					<cfset bean = getBeanFactory().getBean('threadService').getBeanByAttributes(threadID=url.id) />
					<cfif bean.beanExists()>
						<cfset MFEvent.setValue('threadBean',bean) />
					</cfif>
				</cfcase>
				<cfcase value="post">
					<cfset bean = getBeanFactory().getBean('postService').getBeanByAttributes(postID=url.id) />
					<cfif bean.beanExists()>
						<cfset MFEvent.setValue('postBean',bean) />
					</cfif>
				</cfcase>
			</cfswitch>
		</cfif>

		<cfset rc.mmEvents.announceEvent( rc.$,"onMeldForumsDo#cleanEvent#",MFEvent ) />

		<cfif MFEvent.getValue('relocate')>
			<cfif len(MFEvent.getValue('relocateURL'))>	
				<cflocation url="#MFEvent.getValue('relocateURL')#" addtoken="false" />
			<cfelseif len(cgi.http_referer)>	
				<cflocation url="#cgi.http_referer#" addtoken="false" />
			<cfelse>
				<cflocation url="#rc.MFBean.getForumWebRoot()#" addtoken="false" />
			</cfif>
		</cfif>
		
		<cfset rc.MFEvent = MFEvent />
	</cffunction>

</cfcomponent>