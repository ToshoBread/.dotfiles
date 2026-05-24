# GLOBAL STRICT RULES

## Responses

- Use caveman skill to keep concise, unless skill explicitly turned off

## Plan Mode

- Always ask questions if prompt is ambiguous, grill-me skill style

## Build Mode

- Never implement features yourself when possible; delegate sub-agents
- Identify changes from plan that can be implemented in parallel, and delegate sub-agents to implement efficiently

## Code

- Never use ambiguous variable names

### Example

```typescript
// Don't
a.forEach((n) => foo(n));

// Do
userArray.forEach((name) => printName(name));
```
