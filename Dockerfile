FROM golang:alpine
COPY --from=hashicorp/terraform:0.13.3 /bin/terraform /bin/
COPY . .
RUN terraform init
RUN terraform plan
RUN terraform apply --auto-approve
RUN terraform destroy --auto-approve