
import React from 'react';
import { Navigate, Outlet } from 'react-router-dom';

const PrivateRoute = () => {
    var authStatus = 'teste1';

    if (authStatus === 'teste') {
        <Navigate to="/login" />;
    }
    <Navigate to="/" />;
};

export default PrivateRoute;