{{- define "onetimesecret-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onetimesecret-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "onetimesecret-chart.labels" -}}
helm.sh/chart: {{ include "onetimesecret-chart.name" . }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "onetimesecret-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "onetimesecret-chart.redis.name" -}}
redis
{{- end -}}

{{- define "onetimesecret-chart.redis.fullname" -}}
{{ .Release.Name }}-redis
{{- end -}}

{{- define "onetimesecret-chart.onetimesecret.name" -}}
onetimesecret
{{- end -}}

{{- define "onetimesecret-chart.onetimesecret.fullname" -}}
{{ .Release.Name }}-onetimesecret
{{- end -}}
