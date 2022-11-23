
az role definition list --query "[?roleName == 'Storage Account Contributor']"
[
  {
    "assignableScopes": [
      "/"
    ],
    "description": "Lets you manage storage accounts, including accessing storage account keys which provide full access to storage account data.",
    "id": "/subscriptions/9457e63e-f78f-43ca-bc0d-f7c389e8ea6b/providers/Microsoft.Authorization/roleDefinitions/17d1049b-9a84-46fb-8f53-869881c3d3ab",
    "name": "17d1049b-9a84-46fb-8f53-869881c3d3ab",
    "permissions": [
      {
        "actions": [
          "Microsoft.Authorization/*/read",
          "Microsoft.Insights/alertRules/*",
          "Microsoft.Insights/diagnosticSettings/*",
          "Microsoft.Network/virtualNetworks/subnets/joinViaServiceEndpoint/action",
          "Microsoft.ResourceHealth/availabilityStatuses/read",
          "Microsoft.Resources/deployments/*",
          "Microsoft.Resources/subscriptions/resourceGroups/read",
          "Microsoft.Storage/storageAccounts/*",
          "Microsoft.Support/*"
        ],
        "dataActions": [],
        "notActions": [],
        "notDataActions": []
      }
    ],
    "roleName": "Storage Account Contributor",
    "roleType": "BuiltInRole",
    "type": "Microsoft.Authorization/roleDefinitions"
  }
]

# create a stand alone service principal
az ad sp create-for-rbac --name dellaterserviceprincipal
{
  "appId": "55e5af46-bd0e-4d34-8323-143c81024b11",
  "displayName": "dellaterserviceprincipal",
  "password": "yIO8Q~dRZNcWr1bpNCNGSxf6_1rJwU9VP4Ti3cAe",
  "tenant": "5003a9ae-336d-4255-9cc1-a0fd944a2267"
}

az account get-access-token --resource https://graph.microsoft.com
{
  "accessToken": "eyJ0eXAiOiJKV1QiLCJub25jZSI6IkVGV1dSSkd2aVpUSDg0cnlmdUd6cGZUalZ0UU1fMkVrLXJWQzRIN1F0VzAiLCJhbGciOiJSUzI1NiIsIng1dCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiJodHRwczovL2dyYXBoLm1pY3Jvc29mdC5jb20iLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81MDAzYTlhZS0zMzZkLTQyNTUtOWNjMS1hMGZkOTQ0YTIyNjcvIiwiaWF0IjoxNjY4OTY4OTEwLCJuYmYiOjE2Njg5Njg5MTAsImV4cCI6MTY2ODk3Mzk1OSwiYWNjdCI6MCwiYWNyIjoiMSIsImFpbyI6IkFZUUFlLzhUQUFBQWdLejM4a0xGQ1AxQzFSZnFPaUFiL2RyL2Q4UXFwTkhXQlNxNy95c2N3QjJCcVFHRytqbTUwUThsMzRsYzgrU1pwWTdOaVJOUHU5M2VLeVhWY2tFaldoZS9KaGhiajJBRS9BV1FKRmVNemF6bUZQTmV4RmI5L1ZiN3JZY1JlTjhBMEZVQ0pQTFBZa2VUTHJ6MnJibmtOdUZJTlZMUWJaWUxrMGlwcWpJNUtXMD0iLCJhbHRzZWNpZCI6IjE6bGl2ZS5jb206MDAwMzdGRkU1MkYwODhFQyIsImFtciI6WyJwd2QiLCJtZmEiXSwiYXBwX2Rpc3BsYXluYW1lIjoiTWljcm9zb2Z0IEF6dXJlIENMSSIsImFwcGlkIjoiMDRiMDc3OTUtOGRkYi00NjFhLWJiZWUtMDJmOWUxYmY3YjQ2IiwiYXBwaWRhY3IiOiIwIiwiZW1haWwiOiJhZG5hbi5zZWxpbW92aWM3NkBnbWFpbC5jb20iLCJmYW1pbHlfbmFtZSI6IlNlbGltb3ZpYyIsImdpdmVuX25hbWUiOiJBZG5hbiIsImlkcCI6ImxpdmUuY29tIiwiaWR0eXAiOiJ1c2VyIiwiaXBhZGRyIjoiOTIuMzYuMjE4LjIzOSIsIm5hbWUiOiJBZG5hbiBTZWxpbW92aWMiLCJvaWQiOiI0ODQzYzY1YS0xYmVlLTQ1ZTMtOWIzMC00NGYzZmFmN2M5NjEiLCJwbGF0ZiI6IjUiLCJwdWlkIjoiMTAwMzIwMDIzMzQyMjAzRCIsInJoIjoiMC5BWGtBcnFrRFVHMHpWVUtjd2FEOWxFb2lad01BQUFBQUFBQUF3QUFBQUFBQUFBQ1VBQ1UuIiwic2NwIjoiQXVkaXRMb2cuUmVhZC5BbGwgRGlyZWN0b3J5LkFjY2Vzc0FzVXNlci5BbGwgZW1haWwgR3JvdXAuUmVhZFdyaXRlLkFsbCBvcGVuaWQgcHJvZmlsZSBVc2VyLlJlYWRXcml0ZS5BbGwiLCJzdWIiOiJrS1RtcjBXbkdMZEJWOTBERUR1NTM2MWVKNjlyQ1Y5QmVVcU9QU290OWpnIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6IkVVIiwidGlkIjoiNTAwM2E5YWUtMzM2ZC00MjU1LTljYzEtYTBmZDk0NGEyMjY3IiwidW5pcXVlX25hbWUiOiJsaXZlLmNvbSNhZG5hbi5zZWxpbW92aWM3NkBnbWFpbC5jb20iLCJ1dGkiOiJzVEJrcGk0VmZFaXFSbzcwQ2JGRkFBIiwidmVyIjoiMS4wIiwid2lkcyI6WyI2MmU5MDM5NC02OWY1LTQyMzctOTE5MC0wMTIxNzcxNDVlMTAiLCJiNzlmYmY0ZC0zZWY5LTQ2ODktODE0My03NmIxOTRlODU1MDkiXSwieG1zX3N0Ijp7InN1YiI6IkdoM3FySG9IQ18xcV9RYzZnTXpfLU05WElTMlhNeHUxS3RsQkRYeElabncifSwieG1zX3RjZHQiOjE2NjM3ODk1MTR9.eKtmBCsD8bVHnZ-MFbBdqr_uv9TWkNDicpwh6Rt07F2ZX8w5HunfM6uehDNBko9K0voX7PV_MdXr31-jAx_jM67pAhOfz6QaRwe5gMP8HiYp3ciu-OjPTWdksl5xh-Tt22qoEgUtQnkzILMdXRGLHzTTbQN7tb1aJn9DX8wjd6vNI4fRQLvOx3OCekXzJgfYzYXIrUiOZcc81XFRe42EXiXjuLcZKrfj1IPZW4scpYqv-tzMNR5SG7DQxAVWlU3tfSLylOyDqzbkP-jjIIQfXu0iHHq9lJIY3naBoF5m2_1ygtBeSvjPdf3G3zU_dM_V3UlcZ3amz-r51_YF1JmriQ",
  "expiresOn": "2022-11-20 20:52:38.000000",
  "subscription": "9457e63e-f78f-43ca-bc0d-f7c389e8ea6b",
  "tenant": "5003a9ae-336d-4255-9cc1-a0fd944a2267",
  "tokenType": "Bearer"
}

