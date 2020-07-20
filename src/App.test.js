import React from 'react';
import { render } from '@testing-library/react';
import App from './App';

test('has unicorn related stuff', () => {
  const { getByText } = render(<App />);
  expect(getByText(/unicorn/)).toBeTruthy()
});