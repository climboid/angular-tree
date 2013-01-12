window.App = angular.module 'angular_tree_basic', ['$angularTree.directives']

window.App.controller 'AppController', ($scope) ->
	$scope.logs = []
	$scope.treeOptions = 
		expandedIconClass: 'icon-chevron-down'
		collapsedIconClass: 'icon-chevron-right'
		# expandedIconClass: 'icon-minus'
		# collapsedIconClass: 'icon-plus'

		getChildren: (node, cb) ->
			cb [
				{label: 'hello'},
				{label: 'hi'}
			]
		onLabelClick: (node) ->
			$scope.logs = [
				{text: 'selected: ' + JSON.stringify(label:node.label, level:node.level)}
			].concat $scope.logs
		onExpanderClick: (node) ->
			$scope.logs = [
				{text: (if node.expanded then 'expanded' else 'collapsed') + ': ' + JSON.stringify(label:node.label, level:node.level)}
			].concat $scope.logs

