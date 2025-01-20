import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { AuthProvider } from './contexts/AuthContext';
import LoginPage from './pages/login';
import HomePage from './pages/home';
import NavbarGlobal from './components/navbar';
import PrivateRoute from './PrivateRouter';
const App: React.FC = () => {
  return (
    <AuthProvider>
      <BrowserRouter>
        <Routes>
          <Route path="/login" element={<LoginPage />} />
          <Route element={<PrivateRoute />}>
            <Route path="/" element={<>
              <NavbarGlobal />
              <HomePage />
            </>
            } />
          </Route>
        </Routes>
      </BrowserRouter>
    </AuthProvider>
  );
};

export default App;
