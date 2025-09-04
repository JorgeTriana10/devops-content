#  Route 53 — Private Hosted Zone

Creo una **Private Hosted Zone** (PHZ) en la VPC del proyecto:
- **Zone name**: `<HOSTED_ZONE_NAME>` (ej. `vprofile.in` si es solo interno)
- **VPC**: `<VPC_ID>`

Registros A (privados):

db01 -> <PRIVATE_IP_DB01>
mc01 -> <PRIVATE_IP_MC01>
rmq01 -> <PRIVATE_IP_RMQ01>

Valido desde `app01`:
```bash
ping -c 4 db01.<HOSTED_ZONE_NAME>
```

> En mi documentación original ya indicaba crear A-records privados para cada backend y probar resolución desde la app