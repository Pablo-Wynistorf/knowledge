```
gcloud container --project "playground-365617" clusters create-auto "kub-cluster-zur-0" --region "europe-west6" --release-channel "regular" --network "projects/playground-365617/global/networks/default" --subnetwork "projects/playground-365617/regions/europe-west6/subnetworks/default" --cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22"
```
