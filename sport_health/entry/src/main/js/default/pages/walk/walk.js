import router from '@system.router';
import storage from '@system.storage';

export default {
    data: {
        title: "Hello HarmonyOS",
        isHarmonyOS: true,
        lineData: [{
                       "data": [2152, 3096, 1768, 2269, 958, 2981, {
                                                                       value: 4578,
                                                                       description: "4578",
                                                                       textLocation: "top",
                                                                       textColor: "#f772ac"
                                                                   }], "gradient": true,
                   }],
        lineOps: {
            "xAxis": {
                "min": 0, "max": 6, "axisTick": 7, "display": false
            }, "yAxis": {
                "min": 0, "max": 10000,
                "display": false
            }, "series": {
                "lineStyle": {
                    "width": "5px", "smooth": true
                }
            }
        },
        walkData: {
            steps: 4578,
            goal: 10000,
            percent: "45%"
        },
        showData: {
            dailyIf: false,
            weekIf: true,
            monthIf: false,
        },
        times: {
            current: ["Mon", "Tue", "Wed", "Thu", "Fir", "Sat", "Sun"],
            daily: ["9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00"],
            week: ["Mon", "Tue", "Wed", "Thu", "Fir", "Sat", "Sun"],
            month: ["10/04", "10/05", "10/06", "10/07", "10/08", "10/09", "10/10"],
        },
        lineDailyData: [{
                            "data": [568, 421, 312, 529, 127, 468, {
                                                                       value: 732,
                                                                       description: "732",
                                                                       textLocation: "top",
                                                                       textColor: "#f772ac"
                                                                   }], "gradient": true,
                        }],
        lineWeekData: [{
                           "data": [2152, 3096, 1768, 2269, 958, 2981, {
                                                                           value: 4578, description: "4578",
                                                                           textLocation: "top", textColor: "#f772ac"
                                                                       }], "gradient": true,
                       }],
        lineMonthData: [{
                            "data": [2152, 3096, 1768, 2269, 958, 2981, {
                                                                            value: 4578, description: "4578",
                                                                            textLocation: "top", textColor: "#f772ac"
                                                                        }], "gradient": true,
                        }],
        lineOpsDaily: {
            "xAxis": {
                "min": 0, "max": 6, "axisTick": 7, "display": false
            }, "yAxis": {
                "min": 0, "max": 1000,
                "display": false
            }, "series": {
                "lineStyle": {
                    "width": "5px", "smooth": true
                }
            }
        },
        lineOpsNormal: {
            "xAxis": {
                "min": 0, "max": 6, "axisTick": 7, "display": false
            }, "yAxis": {
                "min": 0, "max": 10000,
                "display": false
            }, "series": {
                "lineStyle": {
                    "width": "5px", "smooth": true
                }
            }
        },
    },

    switchTitle() {
        let that = this;
        that.title = that.isHarmonyOS ? "Hello World" : "Hello HarmonyOS";
        that.isHarmonyOS = !that.isHarmonyOS;
    },

    goBack() {
        router.back();
    },

    toTarget() {
        router.push({
            uri: 'pages/plan/plan',
        });
    },

    clickDaily() {
        this.showData.dailyIf = true;
        this.showData.weekIf = false;
        this.showData.monthIf = false;
        this.times.current = this.times.daily;
        this.lineData = this.lineDailyData;
        this.lineOps = this.lineOpsDaily;
    },

    clickWeek() {
        this.showData.dailyIf = false;
        this.showData.weekIf = true;
        this.showData.monthIf = false;
        this.times.current = this.times.week;
        this.lineData = this.lineWeekData;
        this.lineOps = this.lineOpsNormal;
    },

    clickMonth() {
        this.showData.dailyIf = false;
        this.showData.weekIf = false;
        this.showData.monthIf = true;
        this.times.current = this.times.month;
        this.lineData = this.lineMonthData;
        this.lineOps = this.lineOpsNormal;
    }
}