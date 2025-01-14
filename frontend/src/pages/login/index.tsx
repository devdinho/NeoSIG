import React, { useState } from 'react';
import { useAuth } from '../../hooks/useAuth';

const LoginPage: React.FC = () => {
  const { dispatch } = useAuth();
  const [username, setUsername] = useState('');

  const handleLogin = () => {
    dispatch({ type: 'LOGIN', payload: username });
  };

  return (
    <div style={{ padding: '2rem', textAlign: 'center' }}>
      <h1>Login</h1>
      <input
        type="text"
        placeholder="Enter username"
        value={username}
        onChange={(e) => setUsername(e.target.value)}
        style={{ marginBottom: '1rem', padding: '0.5rem', width: '100%' }}
      />
      <button onClick={handleLogin} style={{ padding: '0.5rem 2rem' }}>
        Login
      </button>
    </div>
  );
};

export default LoginPage;
