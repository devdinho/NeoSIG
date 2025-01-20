import React, { useState } from 'react';
import { useAuth } from '../../hooks/useAuth';
import { styled } from 'styled-components';

const Title = styled.h1`
  font-size: 1.5em;
  text-align: center;
  color: #0e5996;
`;
const InputLogin = styled.input`
  margin-bottom: 1rem; 
  padding: 0.5rem; 
  width: 100%;
`;
const Card = styled.div`
  display: flex;
  flex-direction: column;
  background-color: white;
  align-items: center;
  justify-content: center;
`

const LoginPage: React.FC = () => {
  const { dispatch } = useAuth();
  const [username, setUsername] = useState('');

  const handleLogin = () => {
    dispatch({ type: 'LOGIN', payload: username });
  };

  return (
    <Card>
      <Title>Login</Title>
      <InputLogin
        type="text"
        placeholder="Enter username"
        value={username}
        onChange={(e) => setUsername(e.target.value)}
      />
      <button onClick={handleLogin} style={{ padding: '0.5rem 2rem' }}>
        Login
      </button>
    </Card>
  );
};

export default LoginPage;
