package com.example.sport_health.widget.plan;

import com.example.sport_health.ResourceTable;
import ohos.aafwk.ability.AbilitySlice;
import ohos.aafwk.content.Intent;
import ohos.agp.components.Component;
import ohos.agp.components.ComponentContainer;
import ohos.agp.components.LayoutScatter;

public class PlanSlice extends AbilitySlice {
    @Override
    public void onStart(Intent intent) {
        Component component = LayoutScatter.getInstance(this).parse(ResourceTable.Layout_plan_widget, null, false);
        super.setUIContent((ComponentContainer) component);
    }

    @Override
    public void onActive() {
        super.onActive();
    }

    @Override
    public void onForeground(Intent intent) {
        super.onForeground(intent);
    }
}
