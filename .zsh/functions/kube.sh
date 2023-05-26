#!/bin/bash

_get_container() {

}

kdes() {

	local namespace=$(kubectl get ns --no-headers -o custom-columns=":metadata.name" | fzf )

	local deploy=$(kubectl get deploy -n paas-user --no-headers -o custom-columns=":metadata.name" | fzf )

	kubectl get deploy "$deploy" -n "$namespace" -o yaml
}

kexe() {

	local context=$(kubectl config get-contexts --no-headers -o=name | fzf )


	local namespace=$(kubectl --context "$context" get ns --no-headers -o custom-columns=":metadata.name" | fzf )

	local pod=$(kubectl --context "$context" get po -n "$namespace" --no-headers -o custom-columns=":metadata.name" | fzf)

	local container=$(kubectl --context "$context" get pods "$pod" -n "$namespace" -o jsonpath='{range .spec.containers[*]}{.name}{"\n"}{end}' | fzf )

	print "kubectl exec -it $pod -n $namespace -c $container -- /bin/bash"
}

klog() {
	local context=$(kubectl config get-contexts --no-headers -o=name | fzf )
	if [[ $context == "" ]]
	then
		return 0
	fi

	local namespace=$(kubectl --context "$context" get ns --no-headers -o custom-columns=":metadata.name" | fzf )
	if [[ $namespace == "" ]]
	then
		return 0
	fi

	local pod=$(kubectl --context "$context" get po -n "$namespace" --no-headers -o custom-columns=":metadata.name" | fzf)
	if [[ $pod == "" ]]
	then
		return 0
	fi

	local container=$(kubectl --context "$context" get pods "$pod" -n "$namespace" -o jsonpath='{range .spec.containers[*]}{.name}{"\n"}{end}' | fzf )
	if [[ $container == "" ]]
	then
		return 0
	fi

	print -z "kubectl --context $context logs $pod -n $namespace -c $container"
}

kctx() {
	local context=$(kubectl config get-contexts --no-headers -o name | fzf)
	if [[ $context == "" ]]
	then
		return 0
	fi

	echo "switching to context $context"
	kubectl config use-context $context
}