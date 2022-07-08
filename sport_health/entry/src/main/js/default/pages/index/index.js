import router from '@system.router';

export default {
    data: {
        title: "Hello HarmonyOS",
        isHarmonyOS: true,
        demoData: {
            distance: "4 km",
            time: "4.2 h",
            calories: "187 kcal",
            walk: {
                steps: 4578,
                goal: 10000,
                wPercent: "this.demoData.walk.steps" //steps/goal
            },
            sleep: {
                sleepTime: "7h 40m"
            },
            heart: {
                bpm: "92"
            },
            med: {
                value: "20m"
            }
        }
    },

    switchTitle() {
        let that = this;
        that.title = that.isHarmonyOS ? "Hello World" : "Hello HarmonyOS";
        that.isHarmonyOS = !that.isHarmonyOS;
    },

    toWalk() {
        router.push({
            uri: 'pages/walk/walk',
        });
    },

    toTarget() {
        router.push({
            uri: 'pages/plan/plan',
        });
    },
}