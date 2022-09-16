resource "aws_resourcegroups_group" "Sirius360" {
    name     = "${var.environment}-Sirius360_ap-south-1"
    tags_all = { 
        
        Env = "Prod"
    }

    resource_query {
        query = jsonencode(
            {
                ResourceTypeFilters = [
                    "AWS::AllSupported",
                ]
                TagFilters          = [
                    {
                        Key    = "Env"
                        Values = [
                            "Prod",
                        ]
                    },
                ]
            }
        )
        type  = "TAG_FILTERS_1_0"
    }
}