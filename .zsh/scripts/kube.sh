#!/bin/bash

kdep() {
	local namespace
	namespace=$(kubectl get ns --no-headers -o custom-columns=":metadata.name" | fzf )

	local deploy=$(kubectl get deploy -n paas-user --no-headers -o custom-columns=":metadata.name" | fzf )

	kubectl get deploy "$deploy" -n "$namespace" -o yaml
}

kexe() {
	local namespace
	namespace=$(kubectl get ns --no-headers -o custom-columns=":metadata.name" | fzf )

	local pod
	pod=$(kubectl get po -n "$namespace" --no-headers -o custom-columns=":metadata.name" | fzf)
	echo "$pod"

	local container
	container=$(kubectl get pods "$pod" -n "$namespace" -o jsonpath='{range .spec.containers[*]}{.name}{"\n"}{end}' | fzf )

	kubectl exec -it "$pod" -n "$namespace" -c "$container" -- /bin/bash
}

klog() {
	local namespace
	namespace=$(kubectl get ns --no-headers -o custom-columns=":metadata.name" | fzf )

	local pod
	pod=$(kubectl get po -n "$namespace" --no-headers -o custom-columns=":metadata.name" | fzf)
	echo "$pod"

	local container
	container=$(kubectl get pods "$pod" -n "$namespace" -o jsonpath='{range .spec.containers[*]}{.name}{"\n"}{end}' | fzf )

	kubectl logs "$pod" -n "$namespace" -c "$container"
}

kctx() {
	kubectl config use-context $(kubectl config get-contexts -o name | fzf )
}
