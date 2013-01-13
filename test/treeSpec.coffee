should = chai.should()
describe 'tree', ->
	elm = null
	scope = null

	beforeEach module '$angularTree'
	beforeEach inject ($rootScope, $compile) ->
		elm = angular.element '''
			<div angular-tree data-options="treeOptions"></div>
		'''
		scope = $rootScope
		scope.treeOptions = 
			expandedIconClass: 'icon-chevron-down'
			collapsedIconClass: 'icon-chevron-right'
			getChildren: (node, cb) ->
				cb [
					{label: 'hello'},
					{label: 'hi'}
				]

		$compile(elm) scope
		scope.$digest()

	it 'should get 2 root notes at the beginning', ->
		nodes = elm.find('div.angular-tree-node')
		nodes.length.should.equal 2
		$(nodes[0]).find('.angular-tree-node-expander')
			.hasClass('icon-chevron-right').should.equal true
		$(nodes[1]).find('.angular-tree-node-expander')
			.hasClass('icon-chevron-right').should.equal true

