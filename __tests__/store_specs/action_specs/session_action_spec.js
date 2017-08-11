import configureMockStore from 'redux-mock-store';
import thunk from 'redux-thunk';

import * as actions from '../../../app/javascript/store/actions/sessionActions';

const middlewares = [thunk];
const mockStore = configureMockStore(middlewares);

describe('Session action', () => {
    let store;

    beforeEach(() => {
        store = mockStore({
            loggedIn: false,
        });
    });


    it("setLoggedIn dispatches correct actions", () => {
        const loggedIn = true;
        const expectedActions = [
            { type: "SET_LOGGED_IN", payload: loggedIn }
        ];
        store.dispatch(actions.setLoggedIn(loggedIn));
        expect(store.getActions()).toEqual(expectedActions);
    });
});