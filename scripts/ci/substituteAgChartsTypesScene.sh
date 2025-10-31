#!/bin/bash

set -eu

if [[ $(uname) == "Darwin" ]] ; then
    find ./packages/**/src -name \*.ts | xargs sed -e "s/'ag-charts-types\/scene'/'ag-charts-community\/scene'/" -i ''
else
    find ./packages/**/src -name \*.ts | xargs sed -e "s/'ag-charts-types\/scene'/'ag-charts-community\/scene'/" -i''
fi

git apply <<EOF
diff --git a/packages/ag-grid-enterprise/src/agStack/iAgChartsExports.ts b/packages/ag-grid-enterprise/src/agStack/iAgChartsExports.ts
index e485b6842b4..bed022e8c00 100644
--- a/packages/ag-grid-enterprise/src/agStack/iAgChartsExports.ts
+++ b/packages/ag-grid-enterprise/src/agStack/iAgChartsExports.ts
@@ -1,7 +1,7 @@
-import type { IntegratedModule } from 'ag-charts-types';
+import type { AgChartsCommunityModule, IntegratedModule } from 'ag-charts-community';
 
 /** MAKE SURE TO UPDATE THE SCRIPT scripts/ci/substituteAgChartsTypesScene.sh WHEN CHANGING THIS FILE */
-type ChartTypes = IntegratedModule;
+type ChartTypes = typeof AgChartsCommunityModule;
 
 export interface IAgChartsExports {
     readonly beanName: 'agChartsExports';
EOF
