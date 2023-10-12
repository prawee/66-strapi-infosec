module.exports = {
    async beforeCreate(event) {
        console.log('beforeCreate ', event)
        // event.params.data.mobile = 'dddddddddd'
        event.params.data.mobile = btoa(event.params.data.mobile)
    },
};