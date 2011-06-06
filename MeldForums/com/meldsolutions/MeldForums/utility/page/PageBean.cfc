﻿<cfcomponent name="PageBean" extends="MeldForums.com.meldsolutions.core.MeldBean">

	<cfset variables.instance	= StructNew()>
	<cfset variables.MFBean		= "">

	<cffunction name="init" returntype="PageBean" >
		<cfargument name="$" required="true" type="any" />
		<cfargument name="pageManager" required="true" type="any" />
		<cfargument name="size" required="false" type="numeric" default="-1" />
		<cfargument name="start" required="false" type="numeric" default="-1" />
		<cfargument name="count" required="false" type="numeric" default="-1" />
		<cfargument name="page" required="false" type="numeric" default="0" />
		<cfargument name="search" required="false" type="string" default="" />
		<cfargument name="searchtype" required="false" type="string" default="" />

		<cfset variables.$						= arguments.$ />
		<cfset variables.pageManager			= arguments.pageManager />
		
		<cfset setSize( arguments.size ) />
		<cfset setStart( arguments.start ) />
		<cfset setCount( arguments.count ) />
		<cfset setPage( arguments.page ) />
		<cfset setSearch( arguments.search ) />
		<cfset setSearchType( arguments.searchtype ) />
		<cfset setURL( "" ) />
		
		<cfset getStart() />
		
		<cfreturn this />
	</cffunction>

	<!--- url.s : page size --->
	<cffunction name="getSize" returntype="numeric" access="public" output="false">
		<cfreturn variables.instance['Size']>
	</cffunction>
	<cffunction name="setSize" returntype="void" access="public" output="false">
		<cfargument name="val" type="numeric" required="true">
		
		<cfif arguments.val gt 0>
			<cfset variables.instance.size = arguments.val />
		<cfelseif isNumeric( variables.$.event('s') )>
			<cfset variables.instance.size = variables.$.event('s') />
		<cfelse>
			<cfset variables.instance.size = 10 />
		</cfif>
	</cffunction>

	<cffunction name="createNav" returntype="string" access="public" output="false">
		<cfreturn variables.pageManager.createNav( this ) />
	</cffunction>

	<cffunction name="getNav" returntype="string" access="public" output="false">
		<cfif not StructKeyExists(variables.instance,"nav")>
			<cfset variables.instance['nav'] = variables.pageManager.createNav( this ) />
		</cfif>

		<cfreturn variables.instance.nav />
	</cffunction>

	<!--- url.c : record count --->
	<cffunction name="getCount" returntype="numeric" access="public" output="false">
		<cfreturn variables.instance['count']>
	</cffunction>
	<cffunction name="setCount" returntype="void" access="public" output="false">
		<cfargument name="val" type="numeric" required="true">

		<cfif arguments.val gt 0>
			<cfset variables.instance.count = arguments.val />
		<cfelseif isNumeric( variables.$.event('c') )>
			<cfset variables.instance.count = variables.$.event('c') />
		<cfelse>
			<cfset variables.instance.count = 10 />
		</cfif>
	</cffunction>

	<!--- url.p : start position --->
	<cffunction name="getStart" returntype="numeric" access="public" output="false">
		<cfif not variables.instance.start and getPage()>
			<cfset setStart( (getPage()-1)*getSize() ) />
		</cfif>
		<cfreturn variables.instance['start']>
	</cffunction>
	<cffunction name="getPos" returntype="numeric" access="public" output="false">
		<cfreturn getStart() />
	</cffunction>
	<cffunction name="setStart" returntype="void" access="public" output="false">
		<cfargument name="val" type="numeric" required="true">

		<cfif arguments.val gt 0>
			<cfset variables.instance.start = arguments.val />
		<cfelseif isNumeric( variables.$.event('p') )>
			<cfset variables.instance.start = variables.$.event('p') -1 />
		<cfelse>
			<cfset variables.instance.start = 0 />
		</cfif>
	</cffunction>

	<!--- url.pg : page --->
	<cffunction name="getPage" returntype="numeric" access="public" output="false">
		<cfreturn variables.instance['page']>
	</cffunction>
	<cffunction name="setPage" returntype="void" access="public" output="false">
		<cfargument name="val" type="numeric" required="true">

		<cfif arguments.val gt 0>
			<cfset variables.instance.page = arguments.val />
		<cfelseif isNumeric( variables.$.event('pg') ) and variables.$.event('pg') gt 0>
			<cfset variables.instance.page = variables.$.event('pg') />
		<cfelse>
			<cfset variables.instance.page = 1 />
		</cfif>
	</cffunction>
	<cffunction name="getPages" returntype="numeric" access="public" output="false">
		<cfreturn ceiling( getCount()/getSize() )>
	</cffunction>


	<!--- url.k : search criteria --->
	<cffunction name="getSearch" returntype="string" access="public" output="false">
		<cfreturn variables.instance['search']>
	</cffunction>
	<cffunction name="setSearch" returntype="void" access="public" output="false">
		<cfargument name="val" type="string" required="true">

		<cfif len(arguments.val)>
			<cfset variables.instance.search = arguments.val />
		<cfelseif len( variables.$.event('k') )>
			<cfset variables.instance.search = variables.$.event('k') />
		<cfelse>
			<cfset variables.instance.search = "" />
		</cfif>
	</cffunction>

	<!--- url.st : search type --->
	<cffunction name="getSearchType" returntype="string" access="public" output="false">
		<cfreturn variables.instance['searchtype']>
	</cffunction>
	<cffunction name="setSearchType" returntype="void" access="public" output="false">
		<cfargument name="val" type="string" required="true">

		<cfif len(arguments.val)>
			<cfset variables.instance.search = arguments.val />
		<cfelseif len( variables.$.event('st') )>
			<cfset variables.instance.searchtype = variables.$.event('st') />
		<cfelse>
			<cfset variables.instance.searchtype = "" />
		</cfif>
	</cffunction>

	<cffunction name="getPageLimit" returntype="numeric" access="public" output="false">
		<cfreturn int( getCount()/getSize() )+iif( getCount() mod getSize(),de(1),de(0))>
	</cffunction>

	<cffunction name="getURL" returntype="string" access="public" output="false">
		<cfreturn variables.instance['urlstring']>
	</cffunction>
	<cffunction name="setURL" returntype="void" access="public" output="false">
		<cfargument name="urlstring" type="string" required="true">

		<cfset variables.instance.urlstring = arguments.urlstring />
	</cffunction>
</cfcomponent>